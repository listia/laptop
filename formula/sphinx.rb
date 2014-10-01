class Sphinx < Formula
  homepage 'http://www.sphinxsearch.com'
  url 'http://sphinxsearch.com/files/archive/sphinx-0.9.9.tar.gz'
  sha1 '8c739b96d756a50972c27c7004488b55d7458015'
  version '0.9.9'

  head 'http://sphinxsearch.googlecode.com/svn/trunk/'

  devel do
    url 'http://sphinxsearch.com/files/sphinx-2.1.1-beta.tar.gz'
    sha1 '2ccbf75146f54338834a6e37250f1af3c73b9746'
  end

  option 'mysql', 'Force compiling against MySQL'
  option 'pgsql', 'Force compiling against PostgreSQL'

  depends_on :postgresql if build.include? 'pgsql'
  depends_on 'apple-gcc42' if MacOS.version >= :mavericks

  resource 'stemmer' do
    url 'http://snowball.tartarus.org/dist/libstemmer_c.tgz'
  end

  def install
    ENV["CC"] = "/usr/local/bin/gcc-4.2"
    ENV["CXX"] = "/usr/local/bin/g++-4.2"

    (buildpath/'libstemmer_c').install resource('stemmer')

    # libstemmer changed the name of the non-UTF8 Hungarian source files,
    # but the released version of sphinx still refers to it under the old name.
    inreplace "libstemmer_c/Makefile.in",
      "stem_ISO_8859_1_hungarian", "stem_ISO_8859_2_hungarian"

    args = %W[--prefix=#{prefix}
--disable-dependency-tracking
--localstatedir=#{var}
--with-libstemmer]

    %w{mysql pgsql}.each do |db|
      if build.include? db
        args << "--with-#{db}"
      else
        args << "--without-#{db}"
      end
    end

    system "./configure", *args
    system "make install"
  end
end

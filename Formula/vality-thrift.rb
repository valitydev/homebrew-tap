class ValityThrift < Formula
  desc "Vality version of Apache Thrift"
  homepage "https://github.com/valitydev/thrift/"
  url "https://github.com/valitydev/thrift/archive/0.14.2.tar.gz"
  sha256 "01d38bab2b49bf2272ef449379b760e1b3bc7d1f1a7e2d2a99f802e2acb0aa76"
  license "Apache-2.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "bison" => :build
  depends_on "boost" => [:build, :test]
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl@1.1"

  def install
    system "./bootstrap.sh"

    args = %W[
      --disable-debug
      --disable-tests
      --prefix=#{prefix}
      --libdir=#{lib}
      --with-openssl=#{Formula["openssl@1.1"].opt_prefix}
      --without-c_glib
      --without-erlang
      --without-go
      --without-haskell
      --without-java
      --without-netstd
      --without-nodejs
      --without-perl
      --without-php
      --without-php_extension
      --without-py3
      --without-python
      --without-rs
      --without-ruby
      --without-swift
    ]

    ENV.cxx11 if ENV.compiler == :clang

    # Don't install extensions to /usr:
    ENV["PY_PREFIX"] = prefix
    ENV["PHP_PREFIX"] = prefix
    ENV["JAVA_PREFIX"] = buildpath

    system "./configure", *args
    ENV.deparallelize
    system "make"
    system "make", "install"
  end

  test do
    (testpath/"test.thrift").write <<~'EOS'
      service MultiplicationService {
        i32 multiply(1:i32 x, 2:i32 y),
      }
    EOS

    system "#{bin}/thrift", "-r", "--gen", "cpp", "test.thrift"

    system ENV.cxx, "-std=c++11", "gen-cpp/MultiplicationService.cpp",
      "gen-cpp/MultiplicationService_server.skeleton.cpp",
      "-I#{include}/include",
      "-L#{lib}", "-lthrift"
  end
end

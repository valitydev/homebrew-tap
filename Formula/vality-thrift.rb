class ValityThrift < Formula
  desc "Vality version of Apache Thrift"
  homepage "https://github.com/valitydev/thrift/"
  url "https://github.com/valitydev/thrift/archive/refs/tags/0.19.1.tar.gz"
  sha256 "3d9381089da646ad93088915fb8fb748a65a8634b270fcc9f31270274d06f76f"
  license "Apache-2.0"
  head "https://github.com/valitydev/thrift.git", branch: "master"

  bottle do
    root_url "https://github.com/valitydev/homebrew-tap/releases/download/vality-thrift-0.19.1"
    sha256 cellar: :any,                 arm64_sonoma: "26877f02fb8a9eea45a5d88511533790a1d6647e0d906fa0fe882097bdd170af"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ba8f66612430efc166d20747839ce78cb2a80e32335cc8f0c79a1954fc3cb6af"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "bison" => :build
  depends_on "boost" => [:build, :test]
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl@1.1"
  uses_from_macos "zlib"

  conflicts_with "thrift", because: "also installs a 'thrift' executable"

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
      --without-kotlin
      --without-python
      --without-py3
      --without-haxe
      --without-netstd
      --without-perl
      --without-php
      --without-php_extension
      --without-dart
      --without-d
      --without-nodejs
      --without-nodets
      --without-lua
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
    (testpath/"test.thrift").write <<~EOS
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

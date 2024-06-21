class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl/archive/refs/tags/1.9.tar.gz"
  sha256 "9b7eb046857584ebc2125044bb0224875826229f86c7733714948e7ab8e3c8fc"
  license "Apache-2.0"
  head "https://github.com/valitydev/woorl.git", branch: "master"

  bottle do
    root_url "https://github.com/valitydev/homebrew-tap/releases/download/woorl-1.9"
    sha256 cellar: :any,                  arm64_sonoma: "cc2a6a51ea0d9b194c2147c01ee9cd83a151f29fd32d42a558ad04bede9b0e3f"
    sha256 cellar: :any_skip_relocation,  x86_64_linux: "9d6f8e9f5e9a8be8beea1d4d3d7a8a0d2a6b30ec2b6f48782e3bf0ad5843399a"
  end

  depends_on "rebar3" => :build
  depends_on "erlang"
  depends_on "vality-thrift" => :optional

  def install
    system "rebar3", "escriptize"
    bin.install "_build/default/bin/woorl" => "woorl"
  end

  test do
    system "#{bin}/woorl", "-h"
  end
end

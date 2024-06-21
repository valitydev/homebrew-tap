class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl/archive/refs/tags/1.8.tar.gz"
  sha256 "0b2f7e73f119681fe65d04016acd0986da5ddee6a729416baa70828673a935a0"
  license "Apache-2.0"
  head "https://github.com/valitydev/woorl.git", branch: "master"

  bottle do
    root_url "https://github.com/valitydev/homebrew-tap/releases/download/woorl-1.8"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "80064e74b735b5674905d08fc9bfeb05c420d5cf874ddba5f9c730d64b3e61dd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "808b432aaf938dffec2acf4a95d23ec8d1ef53374d22f2f5013b00110b13c022"
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

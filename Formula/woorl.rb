class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl.git",
      tag:      "1.5",
      revision: "324c4dd2dc21f01200a5302d58b8d9424e74814d"
  license "Apache-2.0"
  head "https://github.com/valitydev/woorl.git", branch: "master"

  bottle do
    root_url "https://github.com/valitydev/homebrew-tap/releases/download/woorl-1.5"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur:      "48217f4da7005b560c83f96b1a664f27e869a5360b50ac4c3a494f3d2cc89808"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "36729333c51d14d7c512b1261d43083f2138ec08d5b887e62b056dfea59826d1"
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

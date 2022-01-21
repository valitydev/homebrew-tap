class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl/releases/download/1.6/woorl-1.6.tar.gz"
  sha256 "f2dd57c34db4a20b9e8c970f0b17c300f7969d48ec4f3e2263bc7e8ea6f649d4"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/valitydev/homebrew-tap/releases/download/woorl-1.5"
    sha256 cellar: :any_skip_relocation, all: "48217f4da7005b560c83f96b1a664f27e869a5360b50ac4c3a494f3d2cc89808"
  end

  depends_on "erlang"
  depends_on "vality-thrift"

  def install
    bin.install "woorl"
  end

  test do
    system "#{bin}/woorl", "-h"
  end
end

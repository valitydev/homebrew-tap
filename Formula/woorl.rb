class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl/releases/download/1.9/woorl-1.9.tar.gz"
  sha256 "7fb978afc44798ee85bd87e8f30241b8a027754ec8caeaf3c8d686540a4e7be7"
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

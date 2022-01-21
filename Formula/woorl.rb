class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl/releases/download/1.5/woorl"
  sha256 "53c753c317ae803e5bc58e2d6be1eee315fb7597307d9438b00177f75bacd347"
  license "Apache-2.0"

  depends_on "erlang"

  def install
    bin.install "woorl"
  end

  test do
    system "#{bin}/woorl"
  end
end

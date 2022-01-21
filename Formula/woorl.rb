class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl/archive/1.5.tar.gz"
  sha256 "e6caf0194111ee239e6d305786778ae948b1411849eb09559e941774b417179e"
  license "Apache-2.0"

  depends_on "rebar3" => :build
  depends_on "erlang"

  def install
    system "rebar3", "escriptize"
    bin.install "_build/default/bin/woorl" => "woorl"
  end

  test do
    system "#{bin}/woorl", "-h"
  end
end

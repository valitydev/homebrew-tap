class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl/archive/1.5.tar.gz"
  sha256 "e6caf0194111ee239e6d305786778ae948b1411849eb09559e941774b417179e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/valitydev/homebrew-tap/releases/download/woorl-1.5"
    sha256 cellar: :any_skip_relocation, all: "163b828c5716a4e212993e3f400f5df8a99c4832935f01d4bebcbe5c240717b4"
  end

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

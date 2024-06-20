class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl/archive/refs/tags/1.9.tar.gz"
  sha256 "9b7eb046857584ebc2125044bb0224875826229f86c7733714948e7ab8e3c8fc"
  license "Apache-2.0"
  head "https://github.com/valitydev/woorl.git", branch: "master"

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

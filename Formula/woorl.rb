class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl/archive/refs/tags/1.10.tar.gz"
  sha256 "c3a168b29800412e5b23f99fe58865c9c69a37b72fe076bb61d2fe931615c51e"
  license "Apache-2.0"
  head "https://github.com/valitydev/woorl.git", branch: "master"

  bottle do
    root_url "https://github.com/valitydev/homebrew-tap/releases/download/woorl-1.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fe1205866dae80e85dd53db381be31ade369c872187438ecae68f8dca1305aba"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c56220263273ab80de4739171f99ce45530583b016922ef5d666369ab3c8398e"
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

class Woorl < Formula
  desc "Woody curl"
  homepage "https://github.com/valitydev/woorl/"
  url "https://github.com/valitydev/woorl.git",
      tag:      "1.9",
      revision: "d7b3e5c959b693b166950bbec78e1c4ed7a10285"
  license "Apache-2.0"
  head "https://github.com/valitydev/woorl.git", branch: "master"

  bottle do
    root_url "https://github.com/valitydev/homebrew-tap/releases/download/woorl-1.5"
    sha256 cellar: :any_skip_relocation, all: "48217f4da7005b560c83f96b1a664f27e869a5360b50ac4c3a494f3d2cc89808"
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

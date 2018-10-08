class Armake < Formula
  desc "Arma modding tools (PAA conversion, binarization/rapification, PBO packing)"
  homepage "https://github.com/KoffeinFlummi/armake"
  url "https://github.com/KoffeinFlummi/armake/archive/v0.6.3.tar.gz"
  sha256 "1c3010d4745851b91129367197e9066281ad1dbbe015e9fa5b25a386509ff408"
  head "https://github.com/KoffeinFlummi/armake.git"

  depends_on "bison" => :build
  depends_on "openssl" => :build

  def install
    inreplace "src/unpack.h", "4096", "16384"
    inreplace "Makefile", "  ", "\t"
    system "make"
    bin.install Dir["bin/*"]
    bash_completion.install "completions/armake" => "armake"
  end

  test do
    system "#{bin}/armake"
  end
end

class Armake2 < Formula
  desc "Arma modding tools (PAA conversion, binarization/rapification, PBO packing)"
  homepage "https://github.com/KoffeinFlummi/armake2"
  head "https://github.com/KoffeinFlummi/armake2.git"

  depends_on "openssl" => :build
  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.install "target/release/armake2"
  end

  test do
    system "#{bin}/armake2"
  end
end

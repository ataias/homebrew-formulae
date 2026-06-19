class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.889+e6be5cfe3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.889+e6be5cfe3.tar.xz"
      sha256 "84b76319b22b54602c1172768a96bb937ea9ca02fc26f8c9afeeb0e0e4e9d406"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.889+e6be5cfe3.tar.xz"
      sha256 "8c78917978c0b1936fc9b1532f37acaae1d1c43ffbba5d944d894279e44035f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.889+e6be5cfe3.tar.xz"
      sha256 "7a4d8e22dd3ad744570f1b5bb62abacae863a91069705d148bf2cca9a73a483b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.889+e6be5cfe3.tar.xz"
      sha256 "cd329c10b3bbf8920f499ac34d2cc79609d6f4c0ff58fc0171969122c32df7d7"
    end
  end

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install Dir["lib/*"]
  end

  test do
    system bin/"zig", "init"
    system bin/"zig", "build", "--summary", "all"
    system bin/"zig", "build", "run"
    system bin/"zig", "build", "test", "--summary", "all"
  end
end

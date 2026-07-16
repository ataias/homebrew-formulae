class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.1413+addc3c3b8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.1413+addc3c3b8.tar.xz"
      sha256 "77aa0c6c3719ebe0c2c94b5d07941d1b2895e8db3616dd31073e692c9b094c75"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.1413+addc3c3b8.tar.xz"
      sha256 "95d75d6c37f31af0c7639d8a01b616a4e5cd91cb60e6e3550087bb76e21ecf43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.1413+addc3c3b8.tar.xz"
      sha256 "921a79e05f8ea72e52c6d3a922ce1c85823df930a7a5c570a4c9a787835ad821"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.1413+addc3c3b8.tar.xz"
      sha256 "73059a78b96f21691a42d81ad964c1938a55a92aa65d47b79725d4a0a5e1ec11"
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

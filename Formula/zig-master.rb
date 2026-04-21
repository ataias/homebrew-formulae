class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.56+a8226cd53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.56+a8226cd53.tar.xz"
      sha256 "239a93ffd529c94d6b2b71d561573153e321db5f34d5cb52b40b5d592a75d0e9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.56+a8226cd53.tar.xz"
      sha256 "4680602790eb599f6113f301418006751232862eb1c86653d0bf440aab3d9b14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.56+a8226cd53.tar.xz"
      sha256 "9a05f8d9d0f68ddd37c5d1df62be7328446df261001f27cd4333f1bece0af4e1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.56+a8226cd53.tar.xz"
      sha256 "f9fcdd6ab5eb5850d2805446ce20504b7eefd567f07b64b6b7ab143536f6f576"
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

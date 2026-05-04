class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.242+5d55999d2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.242+5d55999d2.tar.xz"
      sha256 "bf381b89ca99beb7c4363c5bb5b85c8d27d872b65d5b30cdf7bde702abbf6732"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.242+5d55999d2.tar.xz"
      sha256 "4cf3295edc043ffe66d7a009e614717b276ca7276200ba0420aa6f3dc64dfcb7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.242+5d55999d2.tar.xz"
      sha256 "cc15021efb083665efbf0e705543f0bdc02743ce4dac938f436df34d35df6ec3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.242+5d55999d2.tar.xz"
      sha256 "82f91ae6e5937ad9f0d2908e6a3a9fd3209d33ebcd81241a43d1d01613ff2291"
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

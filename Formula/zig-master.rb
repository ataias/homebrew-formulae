class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.16.0-dev.3142+5ccfeb926"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.16.0-dev.3142+5ccfeb926.tar.xz"
      sha256 "0ab967ed551814e7450ce9b6dc11853c96697e9307b8f9bb4283669d3a9860a8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.16.0-dev.3142+5ccfeb926.tar.xz"
      sha256 "7ff94c3c5b70e6b90a9aa74308e05f36620a1c0f2b5c7b62635310eb1c93310b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.16.0-dev.3142+5ccfeb926.tar.xz"
      sha256 "4801ddd0fe720e5b0c177230caa2301ed3ce2e3701beec6c18888b49244c1a5a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.16.0-dev.3142+5ccfeb926.tar.xz"
      sha256 "ab4e7bf6358a63e50aeec2243547b63791c75523685ad458d0c339448d723a88"
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

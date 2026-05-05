class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.248+95507faf1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.248+95507faf1.tar.xz"
      sha256 "1156443649e59f291de2e814ff11cdd75563955947d1f2faa7739d0167345957"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.248+95507faf1.tar.xz"
      sha256 "4f4ea4a19141294b4f257b5179cd7513a90a005219a9cf9475526e1c20bfda6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.248+95507faf1.tar.xz"
      sha256 "ec2e063632bc79a43741c7197f12da636cf3fd571c9cb25d89982d1c4c1d3e43"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.248+95507faf1.tar.xz"
      sha256 "f478c5c58c743be6004a9b9675849fbc0de6483431e06090addbd1d739add7b3"
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

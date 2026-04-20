class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.39+d092c752f"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.39+d092c752f.tar.xz"
      sha256 "71bb3fb0658ad73cbfb3a4e2efbd20ea9bae9590435f15525cde48e3a0356096"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.39+d092c752f.tar.xz"
      sha256 "88d1cb7a62a48722b442baa79a76b70f70d685c498d4a3662c86a0a8bef877d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.39+d092c752f.tar.xz"
      sha256 "deaf832faeaf3fb37758a79ca297fc29c2ba6d4603f9d3abaff2652089fa54af"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.39+d092c752f.tar.xz"
      sha256 "34bc03295977558b0c5c1eec26e61c39f9b4c667fc4bf459f9c98df7d4c07224"
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

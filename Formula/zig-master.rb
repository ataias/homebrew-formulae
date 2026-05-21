class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.314+eae06cf5c"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.314+eae06cf5c.tar.xz"
      sha256 "22de000f2b82d8a71c93f816dabe4ba224473d4e802b28eab77bfa877998a389"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.314+eae06cf5c.tar.xz"
      sha256 "54f64a5655b36b549c989e2a6dca351ca610293e51602ada5b8c46f902c20f31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.314+eae06cf5c.tar.xz"
      sha256 "0c1b2b14d8fe7b2f778a393476362543b4924ff271fd0ec77674cf2c6dd8f422"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.314+eae06cf5c.tar.xz"
      sha256 "ee19df2467fc67af43fefcdaba5bc4f4c1ec114454a3b6cfaa661b6aab063cc1"
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

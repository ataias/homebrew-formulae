class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.38+ae3ab43c"
  license "MIT"
  # zls_commit: ae3ab43c32
  # zig_version: 0.17.0-dev.305+bdfbf432d

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "4fd480c3ca1e99230a959bec0358730a9784e94dee66fd5461493b001318108b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "a913fdece74bf3f079973b3d1385ee5d6cbc648f54271135eb7a94c00bd65702"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "daf1bbb16fced0b59796d60c2ffe87651d43d002b7374744c17c477c16406e50"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "cd37a519536cfa423a21691f067a66f55a89f740ae5ff5f6747ddcc784d246d4"
    end
  end

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end

  test do
    system bin/"zls", "--version"
  end
end

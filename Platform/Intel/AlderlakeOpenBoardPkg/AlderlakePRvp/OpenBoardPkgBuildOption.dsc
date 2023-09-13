## @file
# platform build option configuration file.
#
#   Copyright (c) 2022, Intel Corporation. All rights reserved.<BR>
#   SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

[BuildOptions]

# Define Build Options both for EDK and EDKII drivers.


  DEFINE DSC_S3_BUILD_OPTIONS =

!if gSiPkgTokenSpaceGuid.PcdAcpiEnable == TRUE
  DEFINE DSC_ACPI_BUILD_OPTIONS = -DACPI_SUPPORT=1
!else
  DEFINE DSC_ACPI_BUILD_OPTIONS =
!endif


  DEFINE BIOS_GUARD_BUILD_OPTIONS =

  DEFINE OVERCLOCKING_BUILD_OPTION =

  DEFINE FSP_BINARY_BUILD_OPTIONS =

  DEFINE SKIP_FSP_TEMPRAM_INIT_AND_EXIT_OPTIONS =

  DEFINE OPTIMIZE_DISABLE_OPTIONS =

  DEFINE UP_SERVER_SUPPORT_BUILD_OPTIONS =


  DEFINE TPM_BUILD_OPTION =

  DEFINE TPM2_BUILD_OPTION =

  DEFINE DSC_TBT_BUILD_OPTIONS =

  DEFINE DSC_DCTT_BUILD_OPTIONS =

  DEFINE EMB_BUILD_OPTIONS =

  DEFINE DSC_MEMORY_DOWN_BUILD_OPTIONS = -DMEM_DOWN_FLAG=1

  DEFINE DSC_KBCEMUL_BUILD_OPTIONS =

  DEFINE BOOT_GUARD_BUILD_OPTIONS =

  DEFINE SECURE_BOOT_BUILD_OPTIONS =

  DEFINE USBTYPEC_BUILD_OPTION =

  DEFINE CAPSULE_BUILD_OPTIONS =
  DEFINE DEFAULT_BOOT_TIME_OUT_MACRO = -DDEFAULT_BOOT_TIME_OUT=5

  DEFINE PERFORMANCE_BUILD_OPTION =

  DEFINE DEBUGUSEUSB_BUILD_OPTION =

  DEFINE DISABLE_NEW_DEPRECATED_INTERFACES_BUILD_OPTION =

  DEFINE DSC_SYMBOL_IN_RELEASE_BUILD_OPTIONS =
  DEFINE DSC_SYMBOL_IN_RELEASE_LINK_BUILD_OPTIONS =

  DEFINE SINITBIN_BUILD_OPTION =

  DEFINE MINTREE_FLAG_BUILD_OPTION = -DMINTREE_FLAG=1

DEFINE DSC_PLTPKG_FEATURE_BUILD_OPTIONS = $(DSC_SIPKG_FEATURE_BUILD_OPTIONS)  $(OVERCLOCKING_BUILD_OPTION) $(PERFORMANCE_BUILD_OPTION) $(DEFAULT_BOOT_TIME_OUT_MACRO) $(EMB_BUILD_OPTIONS) $(BIOS_GUARD_BUILD_OPTIONS) $(DSC_TBT_BUILD_OPTIONS)
DEFINE DSC_PLTPKG_FEATURE_BUILD_OPTIONS = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(BOOT_GUARD_BUILD_OPTIONS) $(DSC_MEMORY_DOWN_BUILD_OPTIONS) $(DEBUGUSEUSB_BUILD_OPTION) $(DSC_S3_BUILD_OPTIONS)
DEFINE DSC_PLTPKG_FEATURE_BUILD_OPTIONS = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(FSP_BINARY_BUILD_OPTIONS) $(SKIP_FSP_TEMPRAM_INIT_AND_EXIT_OPTIONS)
DEFINE DSC_PLTPKG_FEATURE_BUILD_OPTIONS = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(DSC_KBCEMUL_BUILD_OPTIONS) $(CAPSULE_BUILD_OPTIONS) $(SECURE_BOOT_BUILD_OPTIONS)  $(DISABLE_NEW_DEPRECATED_INTERFACES_BUILD_OPTION)
DEFINE DSC_PLTPKG_FEATURE_BUILD_OPTIONS = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(TPM2_BUILD_OPTION) $(TPM_BUILD_OPTION) $(DSC_DCTT_BUILD_OPTIONS)
DEFINE DSC_PLTPKG_FEATURE_BUILD_OPTIONS = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(DSC_ACPI_BUILD_OPTIONS) $(UP_SERVER_SUPPORT_BUILD_OPTIONS) $(USBTYPEC_BUILD_OPTION) $(SINITBIN_BUILD_OPTION) $(MINTREE_FLAG_BUILD_OPTION)

[BuildOptions.Common.EDKII]
#
# For IA32 Global Build Flag
#
       *_*_IA32_CC_FLAGS      = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) -D PI_SPECIFICATION_VERSION=0x00010015 -DASF_PEI
       *_*_IA32_VFRPP_FLAGS   = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
       *_*_IA32_APP_FLAGS     = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
       *_*_IA32_ASLPP_FLAGS   = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
       *_*_IA32_ASLCC_FLAGS   = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
       *_*_IA32_NASM_FLAGS    = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)

#
# For IA32 Specific Build Flag
#
GCC:   *_*_IA32_PP_FLAGS      = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
MSFT:  *_*_IA32_ASM_FLAGS     = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
MSFT:  *_*_IA32_CC_FLAGS      = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(OPTIMIZE_DISABLE_OPTIONS) -D PI_SPECIFICATION_VERSION=0x00010015 -DASF_PEI
MSFT:  *_*_IA32_VFRPP_FLAGS   = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(OPTIMIZE_DISABLE_OPTIONS)
MSFT:  *_*_IA32_APP_FLAGS     = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(OPTIMIZE_DISABLE_OPTIONS)
MSFT:  *_*_IA32_ASLPP_FLAGS   = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(OPTIMIZE_DISABLE_OPTIONS)
MSFT:  *_*_IA32_ASLCC_FLAGS   = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(OPTIMIZE_DISABLE_OPTIONS)

#
# For X64 Global Build Flag
#
       *_*_X64_CC_FLAGS       = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) -D PI_SPECIFICATION_VERSION=0x00010015
       *_*_X64_VFRPP_FLAGS    = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
       *_*_X64_APP_FLAGS      = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
       *_*_X64_ASLPP_FLAGS    = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
       *_*_X64_ASLCC_FLAGS    = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
       *_*_X64_NASM_FLAGS     = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)

#
# For X64 Specific Build Flag
#
GCC:   *_*_X64_PP_FLAGS       = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
MSFT:  *_*_X64_ASM_FLAGS      = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
MSFT:  *_*_X64_CC_FLAGS       = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(OPTIMIZE_DISABLE_OPTIONS) -D PI_SPECIFICATION_VERSION=0x00010015
MSFT:  *_*_X64_VFRPP_FLAGS    = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(OPTIMIZE_DISABLE_OPTIONS)
MSFT:  *_*_X64_APP_FLAGS      = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS) $(OPTIMIZE_DISABLE_OPTIONS)
MSFT:  *_*_X64_ASLPP_FLAGS    = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)
MSFT:  *_*_X64_ASLCC_FLAGS    = $(DSC_PLTPKG_FEATURE_BUILD_OPTIONS)

##################
# Rsa2048Sha256Sign tool definitions
#
# Notes: This tool defintion uses a test signing key for development purposes only.
#        The tool Rsa2048Sha256GenerateKeys can be used to generate a new private/public key
#        and the gEfiSecurityPkgTokenSpaceGuid.PcdRsa2048Sha256PublicKeyBuffer PCD value.
#        A custom tool/script can be implemented using the new private/public key with
#        the Rsa2048Sha256Sign tool and this tool defintiion can be updated to use a
#        custom tool/script.
#
#   Generate new private/public key and gEfiSecurityPkgTokenSpaceGuid.PcdRsa2048Sha256PublicKeyBuffer PCD value
#
#       Rsa2048Sha256GenerateKeys.py -o MyKey.pem --public-key-hash-c MyKey.pcd
#
#   Custom script example (MyRsa2048Sha256Sign.cmd):
#
#       Rsa2048Sha256Sign --private-key MyKey.pem %1 %2 %3 %4 %5 %6 %7 %8 %9
#
#   WARNING: Vendors that uses private keys are responsible for proper management and protection
#            of private keys.  Vendors may choose to use infrastructure such as signing servers
#            or signing portals to support the management and protection of private keys.
#
##################
*_*_*_RSA2048SHA256SIGN_PATH  = Rsa2048Sha256SignPlatform
*_*_*_RSA2048SHA256SIGN_GUID  = A7717414-C616-4977-9420-844712A735BF

# Force PE/COFF sections to be aligned at 4KB boundaries to support page level protection
[BuildOptions.common.EDKII.DXE_SMM_DRIVER, BuildOptions.common.EDKII.SMM_CORE]
  MSFT:*_*_*_DLINK_FLAGS = /ALIGN:4096
  GCC:*_GCC*_*_DLINK_FLAGS = -z common-page-size=0x1000

# Force PE/COFF sections to be aligned at 4KB boundaries to support MemoryAttribute table
[BuildOptions.common.EDKII.DXE_RUNTIME_DRIVER]
  MSFT:*_*_*_DLINK_FLAGS = /ALIGN:4096
  GCC:*_GCC*_*_DLINK_FLAGS = -z common-page-size=0x1000

# Force PE/COFF sections to be aligned at 4KB boundaries to support NX protection
[BuildOptions.common.EDKII.DXE_DRIVER, BuildOptions.common.EDKII.DXE_CORE, BuildOptions.common.EDKII.UEFI_DRIVER, BuildOptions.common.EDKII.UEFI_APPLICATION]
  #MSFT:*_*_*_DLINK_FLAGS = /ALIGN:4096
  #GCC:*_GCC*_*_DLINK_FLAGS = -z common-page-size=0x1000
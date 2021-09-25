Pod::Spec.new do |spec|
  spec.name = "mozjpeg"
  spec.version = "4.0.3"
  spec.license = { :type => "BSD" }
  spec.homepage = "https://github.com/espresso3389/mozjpeg"
  spec.summary = "Improved JPEG encoder."
  spec.authors = "Mozilla"
  spec.source = { :git => "https://github.com/espresso3389/mozjpeg.git", :tag => "v#{spec.version}" }
  spec.module_name = "mozjpeg"
  spec.header_dir = "mozjpeg"
  spec.platforms = { :ios => "11.0" }
  spec.prepare_command = <<-CMD
    cat << EOF > jconfig.h
    #define JPEG_LIB_VERSION  62
    #define LIBJPEG_TURBO_VERSION  4.1.0
    #define LIBJPEG_TURBO_VERSION_NUMBER  4001000
    #define C_ARITH_CODING_SUPPORTED 1
    #define D_ARITH_CODING_SUPPORTED 1
    #define MEM_SRCDST_SUPPORTED 1
    #define BITS_IN_JSAMPLE  8
    #define HAVE_LOCALE_H 1
    #define HAVE_STDDEF_H 1
    #define HAVE_STDLIB_H 1
    #define HAVE_UNSIGNED_CHAR 1
    #define HAVE_UNSIGNED_SHORT 1
    #define NEED_SYS_TYPES_H 1
    #define WITH_SIMD 1
    EOF


    cat << EOF > jconfigint.h
    #define BUILD  "20210924"
    #undef inline
    #define INLINE  __inline__ __attribute__((always_inline))
    #define THREAD_LOCAL  
    #define PACKAGE_NAME  "mozjpeg"
    #define VERSION "#{spec.version}"
    #ifdef __SIZEOF_SIZE_T__
      #define SIZEOF_SIZE_T __SIZEOF_SIZE_T__
    #else
      #error Cannot determine the size of size_t
    #endif
    #define HAVE_BUILTIN_CTZL
    EOF
  CMD

  spec.private_header_files = "jchuff.h",
                              "jcmaster.h",
                              "jconfigint.h",
                              "jdcoefct.h",
                              "jdct.h",
                              "jdhuff.h",
                              "jdmainct.h",
                              "jdmaster.h",
                              "jdmerge.h",
                              "jdsample.h",
                              "jmemsys.h",
                              "jpeg_nbits_table.h",
                              "jpegcomp.h",
                              "jsimd.h",
                              "jsimddct.h",
                              "jversion.h"

  spec.public_header_files = "jerror.h",
                             "jinclude.h",
                             "jconfig.h",
                             "jmorecfg.h",
                             "jpeglib.h",
                             "jpegint.h",
                             "transupp.h",
                             "turbojpeg.h"

  spec.source_files = "jcapimin.c",
                      "jcapistd.c",
                      "jccoefct.c",
                      "jccolor.c",
                      "jcdctmgr.c",
                      "jchuff.c",
                      "jcext.c",
                      "jcicc.c",
                      "jcinit.c",
                      "jcmainct.c",
                      "jcmarker.c",
                      "jcmaster.c",
                      "jcomapi.c",
                      "jcparam.c",
                      "jcphuff.c",
                      "jcprepct.c",
                      "jcsample.c",
                      "jctrans.c",
                      "jdapimin.c",
                      "jdapistd.c",
                      "jdatadst.c",
                      "jdatasrc.c",
                      "jdcoefct.c",
                      "jdcolor.c",
                      "jddctmgr.c",
                      "jdhuff.c",
                      "jdicc.c",
                      "jdinput.c",
                      "jdmainct.c",
                      "jdmarker.c",
                      "jdmaster.c",
                      "jdmerge.c",
                      "jdphuff.c",
                      "jdpostct.c",
                      "jdsample.c",
                      "jdtrans.c",
                      "jerror.c",
                      "jfdctflt.c",
                      "jfdctfst.c",
                      "jfdctint.c",
                      "jidctflt.c",
                      "jidctfst.c",
                      "jidctint.c",
                      "jidctred.c",
                      "jquant1.c",
                      "jquant2.c",
                      "jutils.c",
                      "jmemmgr.c",
                      "jmemnobs.c",
                      "jaricom.c",
                      "jcarith.c",
                      "jdarith.c",
                      "jsimd_none.c",
                      "transupp.c",

                      "jerror.h",
                      "jinclude.h",
                      "jconfig.h",
                      "jmorecfg.h",
                      "jpeglib.h",
                      "jpegint.h",
                      "transupp.h",
                      "turbojpeg.h",

                      "jchuff.h",
                      "jcmaster.h",
                      "jconfigint.h",
                      "jdcoefct.h",
                      "jdct.h",
                      "jdhuff.h",
                      "jdmainct.h",
                      "jdmaster.h",
                      "jdmerge.h",
                      "jdsample.h",
                      "jmemsys.h",
                      "jpeg_nbits_table.h",
                      "jpegcomp.h",
                      "jsimd.h",
                      "jsimddct.h",
                      "jversion.h"
                      

  # Despite their extensions, these are header files that shouldn't be compiled
  # on their own but should still be present for other files to include.
  spec.preserve_path = "jdcolext.c",
                       "jstdhuff.c",
                       "jdcol565.c",
                       "jdmrgext.c",
                       "jdmrg565.c",
                       "jccolext.c"

  spec.compiler_flags = ['-fexceptions']
end

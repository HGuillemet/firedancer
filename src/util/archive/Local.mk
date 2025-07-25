$(call add-hdrs,fd_ar.h fd_tar.h)
$(call add-objs,fd_ar fd_tar_writer fd_tar_reader,fd_util)
$(call make-unit-test,test_ar,test_ar,fd_util)
$(call run-unit-test,test_ar)
$(call make-unit-test,test_tar,test_tar,fd_util)
$(call run-unit-test,test_tar)
ifdef FD_HAS_HOSTED
$(call make-fuzz-test,fuzz_tar,fuzz_tar,fd_ballet fd_util)
$(call make-fuzz-test,fuzz_ar,fuzz_ar,fd_ballet fd_util)
endif


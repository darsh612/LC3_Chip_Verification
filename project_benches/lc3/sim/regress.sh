rm -rf *ucdb
rm -rf transcript.*
make clean
make emu_build
make run_cli TEST_NAME=test_top TEST_SEED=1234 > transcript_test_top
make run_cli TEST_NAME=load_test TEST_SEED=2759 > transcript_load_test
make run_cli TEST_NAME=store_test TEST_SEED=7493 > transcript_store_test
make run_cli TEST_NAME=branch_test TEST_SEED=1234 > transcript_branch_test
make run_cli TEST_NAME=jump_test TEST_SEED=1234 > transcript_jump_test
make run_cli TEST_NAME=alu_test TEST_SEED=random > transcript_alu_test
make merge_coverage_with_test_plan

# #!/bin/sh
# rm *.ucdb

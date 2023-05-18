###############################################################################
#																																							#
# Makefile for foundry																												#
#																																							#
# License : MIT																																#
# Author  : Gokhan Polat																											#
# Date    : 17/05/2023																												#
#																																							#
# Description:																																#
# ------------																																#
# type "make" or "make help" to see commands																	#
#																																							#
###############################################################################


# ENV and DEFAULTS ############################################################
# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env
.DEFAULT_GOAL := help
.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


_verbose_ :; ## for test verbosity use 'verbose=vvv' at the end of command, v count can be up 5, include 5

###############################################################################
#                                  VARIABLES                                  #
###############################################################################
FORGE_TEST_WITH_PATH        = forge test --match-path
FORGE_TEST_WITH_CONTRACTS   = forge test --contracts
FORGE_SCRIPT                = forge script
FORGE_SCRIPT_WITH_CONTRACTS = forge script --contracts

# IGNORE_FLYCHECK             = --no-match-contract=flycheck

# CONTRACTS ###################################################################

# MAIN TOKEN
SCRIPT_PATH       = ./script
MAINTOKEN_TEST    = ./test/MainToken.t.sol
MAINTOKEN_SCRIPT  = ./script/MainToken.s.sol


###############################################################################
#                                  forge commands                             #
###############################################################################
install       :; forge install               ## Install project dependencies
update        :; forge update                ## Update project dependencies
build         :; forge build                 ## Build the project's smart contracts
trace-report  :; forge test -vv --gas-report ## Run tests with gas reporting
clean         :; forge clean                 ## Remove the build artifacts and cache directories
snapshot      :; forge snapshot              ## Create a snapshot of each test's gas usage
# fmt           :; forge fmt                  ### Formats Solidity source files
# test        :; forge test                   ### Run the project's tests
# trace       :; forge test -vv               ### Run the project's tests with verbose level 2
# trace-watch :; forge test -vv -watch        ### Run the project's tests with verbose level 2 and watch



###############################################################################
#                                  MAIN TOKEN                                 #
###############################################################################

MAINTOKEN-test           :; ## MAIN TOKEN TEST
	${FORGE_TEST_WITH_PATH} ${MAINTOKEN_TEST} ${verbose}

MAINTOKEN-test-gasreport :; ## MAIN TOKEN TEST WITH GAS REPORT
	${FORGE_TEST_WITH_PATH} ${MAINTOKEN_TEST} ${verbose} --gas-report


MAINTOKEN-test-anvil :; ## MainToken test with 'anvil -b 3'
	${FORGE_TEST_WITH_CONTRACTS} ${MAINTOKEN_TEST} -f http://localhost:8545 ${verbose}

MAINTOKEN-deploy-goerli :; ## Deploy Goerli testnet
	${FORGE_SCRIPT_WITH_CONTRACTS} ${SCRIPT_PATH} ${MAINTOKEN_SCRIPT} --rpc-url ${RPC_GOERLI} --broadcast -vvv

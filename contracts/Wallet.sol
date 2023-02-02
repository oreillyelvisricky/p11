// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Wallet {
  struct Transfer {
    uint256 transferNum;

    address receiver;
    uint256 amount;

    uint256 transferLayersIndex;

    bool executed;
  }

  uint numTransfers;
  mapping (uint => Transfer) Transfers;


  function makeTransfer(
    address _receiver,
    uint256 _amount
  ) private {
    addTransfer(_receiver, _amount);
  }

  function addTransfer(
    address _receiver,
    uint256 _amount
  ) private {
    Transfer storage transfer = Transfers[numTransfers];

    transfer.transferNum = numTransfers;

    transfer.receiver = _receiver;
    transfer.amount = _amount;

    transfer.transferLayersIndex = numTransfers;

    transfer.executed = false;

    numTransfers++;
  }




  event TestLogNumTransfers(uint _numTransfers);
  event TestLogTransfer();


  function test(address _receiver) public virtual {
    // testSetLayersToMakeTransfer();
    // testLogLayersToMakeTransfer();

    uint256 amount = 1000;
    
    testMakeTransfer(_receiver, amount);
    testMakeTransfer(_receiver, amount);
    testMakeTransfer(_receiver, amount);
    testMakeTransfer(_receiver, amount);
    testMakeTransfer(_receiver, amount);
    testLogTransfers();
  }

  function testMakeTransfer(
    address _receiver,
    uint256 _amount
  ) private {
    makeTransfer(_receiver, _amount);
  }

  function testLogTransfers() private {
    emit TestLogNumTransfers(numTransfers);

    for (uint transferNum = 0; transferNum < numTransfers; transferNum++) {
      emit TestLogTransfer();
    }
  }
}

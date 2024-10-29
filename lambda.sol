// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleFlightTracker {
    struct Flight {
        string flightNumber;
        string destination;
        string departure;
        uint256 departureTime;
        uint256 arrivalTime;
        string status;
    }

    mapping(string => Flight) private flights;

    function registerFlight(
        string memory _flightNumber,
        string memory _destination,
        string memory _departure,
        uint256 _departureTime,
        uint256 _arrivalTime,
        string memory _status
    ) public {
        flights[_flightNumber] = Flight({
            flightNumber: _flightNumber,
            destination: _destination,
            departure: _departure,
            departureTime: _departureTime,
            arrivalTime: _arrivalTime,
            status: _status
        });
    }

    function getFlight(string memory _flightNumber) public view returns (
        string memory flightNumber,
        string memory destination,
        string memory departure,
        uint256 departureTime,
        uint256 arrivalTime,
        string memory status
    ) {
        Flight memory flight = flights[_flightNumber];
        return (
            flight.flightNumber,
            flight.destination,
            flight.departure,
            flight.departureTime,
            flight.arrivalTime,
            flight.status
        );
    }

    function flightExists(string memory _flightNumber) public view returns (bool) {
        return bytes(flights[_flightNumber].flightNumber).length > 0;
    }
}

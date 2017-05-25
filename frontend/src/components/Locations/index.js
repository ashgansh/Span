import React from 'react';
import styled from 'styled-components';

const LocationsWrapper = styled.div`
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
`;

const Location = styled.div`
  border: solid;
  margin-bottom: 1em;
  height: ${(props) => 80 / props.locationCount}em;
  width: ${(props) => 80 / props.locationCount}em;
`;

const locationCount = 3;

const Locations = () => (
  <LocationsWrapper>
    <Location locationCount={locationCount}>wepoiruq</Location>
    <Location locationCount={locationCount}>wepoiruq</Location>
    <Location locationCount={locationCount}>wepoiruq</Location>
  </LocationsWrapper>
);

export default Locations;

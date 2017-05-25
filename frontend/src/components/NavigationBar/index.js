import React from 'react';
import styled from 'styled-components';
import {
  Link,
} from 'react-router-dom';

const NavBar = styled.div`
  height: 10%;
  width: calc(100% - 2em);
  position: fixed;
  margin: 1em;
  display: flex;
  justify-content: space-between;
  align-items: center;

  background-color: papayawhip;
`;

const NavigationBar = () => (
  <NavBar>
    <Link to="/asset-list">
      List
    </Link>
    <Link to="/asset-form">
      Form
    </Link>
  </NavBar>
);

export default NavigationBar;

import React, { Component } from 'react';
import {
  BrowserRouter as Router,
  Route,
  Link,
  Switch,
  Redirect,
} from 'react-router-dom';
import styled from 'styled-components';
import { ApolloClient, createNetworkInterface, ApolloProvider } from 'react-apollo';
import './App.css';
import AssetList from './components/AssetList';
import AssetForm from './components/AssetForm';


const networkInterface = createNetworkInterface({
  uri: '/graphiql',
});

const client = new ApolloClient({
  networkInterface,
});

const BaseWrapper = styled.div`
  display: flex;
  flex-direction: column;
  max-height: 100vh;
`;

const NavBar = styled.div`
  height: 10%;
  width: 90%;
  position: fixed;
  margin: 1em;
  display: flex;
  justify-content: space-between;
  background-color: papayawhip;
`;

const ContentWrapper = styled.div`
  margin-top: 5em;
  margin-right: 1em;
  margin-left: 1em;
`;

class App extends Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <Router>
          <BaseWrapper>
            <NavBar>
              <Link to="/asset-list">
                List
              </Link>
              <Link to="/asset-form">
                Form
              </Link>
            </NavBar>
            <ContentWrapper>
              <Switch>
                <Route path="/asset-form" component={AssetForm} />
                <Route path="/asset-list" component={AssetList} />
                <Redirect to="/asset-form" />
              </Switch>
            </ContentWrapper>
          </BaseWrapper>
        </Router>
      </ApolloProvider>
    );
  }
}


export default App;

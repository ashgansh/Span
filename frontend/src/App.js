import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { ApolloClient, createNetworkInterface, ApolloProvider} from 'react-apollo';
import Assets from './containers/Asset';
import AssetForm from './containers/AssetForm';
import styled from 'styled-components';

const networkInterface = createNetworkInterface({
  uri: '/graphiql'
});

const client = new ApolloClient({
  networkInterface: networkInterface
});

const ContentWrapper = styled.section`
  max-height: 100vh;
  background: papayawhip;
  overflow-y: scroll;
  display: flex;
  justify-content: space-between;
`


class App extends Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <div className="App">
          <div className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
          </div>
          <ContentWrapper>
            <Assets />
            <AssetForm />
          </ContentWrapper>
        </div>
      </ApolloProvider>
    );
  }
}


export default App;

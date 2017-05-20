import React, { Component } from 'react';
import styled from 'styled-components';
import { ApolloClient, createNetworkInterface, ApolloProvider } from 'react-apollo';
import './App.css';
import Assets from './components/AssetList';
import AssetForm from './components/AssetForm';

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

import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { ApolloClient, createNetworkInterface, ApolloProvider} from 'react-apollo';
import Asset from './containers/Asset';

const networkInterface = createNetworkInterface({
  uri: '/graphiql'
});

const client = new ApolloClient({
  networkInterface: networkInterface
});


class App extends Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <div className="App">
          <div className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
          </div>
          <Asset />
        </div>
      </ApolloProvider>
    );
  }
}


export default App;

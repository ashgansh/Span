import React, { Component } from 'react';
import {
  BrowserRouter as Router,
  Route,
  Switch,
  Redirect,
} from 'react-router-dom';
import { ApolloClient, createNetworkInterface, ApolloProvider } from 'react-apollo';
import './App.css';

import AssetList from './components/AssetList';
import AssetForm from './components/AssetForm';
import NavigationBar from './components/NavigationBar';
import Locations from './components/Locations';

import {
  BaseWrapper,
  ContentWrapper,
} from './components/Wrappers';


const networkInterface = createNetworkInterface({
  uri: '/graphiql',
});

const client = new ApolloClient({
  networkInterface,
});


class App extends Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <Router>
          <BaseWrapper>
            <NavigationBar />
            <ContentWrapper>
              <Switch>
                <Route path="/asset-form" component={AssetForm} />
                <Route path="/asset-list" component={AssetList} />
                <Route path="/locations" component={Locations} />
                <Redirect to="/locations" />
              </Switch>
            </ContentWrapper>
          </BaseWrapper>
        </Router>
      </ApolloProvider>
    );
  }
}


export default App;

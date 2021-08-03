
import './index.css';
import React, {Component} from 'react';
import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  useQuery,
  gql
} from "@apollo/client";

// components
import DrumList from './components/DrumList';
import AddDrum from './components/EnrollDrum';


const client = new ApolloClient({
  uri: 'https://api.studio.thegraph.com/query/3034/kcloud/v0.0.3',
  cache: new InMemoryCache()
})

class App extends Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <div id = "main">
          <h1>My Radioactive Drums</h1>
          <DrumList />
          <AddDrum />
        </div>
      </ApolloProvider>
    );
  }
}
export default App;
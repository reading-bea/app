import { registerRootComponent } from 'expo';
import React from 'react';
import Layout from './components/layout';

class App extends React.Component {
  render() {
    return <Layout />;
  }
}

registerRootComponent(App);
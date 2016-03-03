import React from 'react';
// -- Components
import Header from '../components/header'
import Footer from '../components/footer'
// -- Context

const App = props => {
  return (
    <article>
      <Header />
      {props.children}
      <Footer />
    </article>
  );
};

export default App;

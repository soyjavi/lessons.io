import React from 'react';
// -- Components
import Button from '../../components/button'
import Title from '../../components/title'
// -- Context
import style from './style.scss';
import C from '../../constants'

const Landing = props => {
  return (
    <section data-component-layout='series' >
      <Title caption='Series disponibles' description='Lorem ipsum...' />
    </section>
  );
};

Landing.propTypes = {
  caption: React.PropTypes.string
};

Landing.defaultProps = {
  caption: ''
};

Landing.onClick = function() {
  alert('Hello world')
};

export default Landing;

import React from 'react';
import style from './style.scss';

const Footer = props => {
  return (
    <footer className={style.root}>
      <small>Copyright Zetapath LTD, 2016</small>
    </footer>
  );
};

Footer.propTypes = {
  session: React.PropTypes.object
};

Footer.defaultProps = {
  object: undefined
};

export default Footer;

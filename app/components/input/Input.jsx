import React from 'react';
// -- Context
import style from './style';

class Input extends React.Component {

  static propTypes = {
    className: React.PropTypes.string,
    multiline: React.PropTypes.bool,
    type: React.PropTypes.string,
    value: React.PropTypes.any
  };

  static defaultProps = {
    className: ``,
    multiline: false,
    type: 'text'
  };

  render () {
    const { className, multiline, type, value, ...others} = this.props;

    const properties = {
      others,
      className: `${style.root} ${className}`,
      type,
      value
    };

    return React.createElement(multiline ? 'textarea' : 'input', properties);
  }
}

export default Input;

import React from 'react';
import ReactDOM from 'react-dom';
// -- Context
import style from './style.scss';

class Form extends React.Component {

  static propTypes = {
    className: React.PropTypes.string,
    onChange: React.PropTypes.func,
    onSubmit: React.PropTypes.func
  };

  static defaultProps = {
    className: '',
  };

  handleChange = (field, value, event) => {
    this.props.onChange(event, _parseValues(this.refs));
  };

  handleSubmit = (event) => {
    event.preventDefault();
    this.props.onSubmit(event, _parseValues(this.refs));
  };

  render () {
    return (
      <form
        className={this.props.className}
        onChange={this.props.onChange ? this.handleChange : null}
        onSubmit={this.props.onSubmit ? this.handleSubmit : null}
      >
        {React.Children.map(this.props.children, (child) => {
          return React.cloneElement(child, { ref: child.ref });
        })}
      </form>
    );
  }
}

export default Form;

const _parseValues = (refs) => {
  const value = {};
  Object.keys(refs).forEach((key) => {
    value[key] = ReactDOM.findDOMNode(refs[key]).value;
  });
  return value;
}

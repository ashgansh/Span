import React, { Component } from 'react';
import { gql, graphql } from 'react-apollo';
import Button from './Button';

class AssetForm extends Component {

  constructor(props) {
    super(props);
    this.state = {
      name: '',
      location: '',
    };
  }

  onClick = (e) => {
    e.preventDefault();
    this.props.createAsset(this.state.name, 'shams')
      .then(({ data }) => console.log('got data', data))
      .catch((error) => console.log('there was an error', error))
  }

  onChange = (e) => {
    this.setState({
      name: e.target.value,
    })
  }

  render() {

    return (
      <form>
        <label>Name</label>
        <input onChange={this.onChange}/>
        <Button onClick={this.onClick}>Click</Button>
      </form>
    )
  }
}


const createAssetMutation = gql`
mutation CreateAsset($name: String!, $location: String!) {
create_asset(name: $name, location: $location)  {
id
name
location
}
}
`;

const updateQueries = {
  hello: (prev, { mutationResult }) => {
    const newAsset = mutationResult.data.create_asset;
    if (Array.isArray(prev.assets)) {
      prev.assets.push(newAsset);
    }
    return prev;
  },
};

const AssetFormWithData = graphql(createAssetMutation, {
  props: ({ mutate }) => ({
    createAsset: (name, location) => mutate({
      variables: { name, location },
      updateQueries,
    }),
  }),
})(AssetForm);

export default AssetFormWithData;

import React from 'react';
import { gql, graphql } from 'react-apollo';
import Button from '../Wrappers/Button';
import enhance from './enhancer';


const AssetForm = enhance(({ onClick, onChange }) => (
  <form>
    <label htmlFor="Name">Name</label>
    <input onChange={onChange} />
    <Button onClick={onClick}>Click</Button>
  </form>
));

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

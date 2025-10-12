export type RootStackParamList = {
  Home: undefined;
  Details: { itemId: number };
  Profile: { name?: string } | undefined;
};
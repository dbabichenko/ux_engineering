import * as React from "react";
import { View, Text, Button, StyleSheet } from "react-native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { RootStackParamList } from "../navigation/types";

type Props = NativeStackScreenProps<RootStackParamList, "Details">;

export default function DetailsScreen({ route, navigation }: Props) {
  const { itemId } = route.params;

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Details</Text>
      <Text style={styles.paragraph}>Item ID: {String(itemId)}</Text>
      <Button title="Go back" onPress={() => navigation.goBack()} />
      <View style={{ height: 12 }} />
      <Button
        title="Replace → Profile"
        onPress={() => navigation.replace("Profile", { name: "Grace" })}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, gap: 12, justifyContent: "center" },
  title: { fontSize: 28, fontWeight: "700" },
  paragraph: { fontSize: 16, lineHeight: 22, opacity: 0.8 },
});

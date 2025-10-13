import * as React from "react";
import { View, Text, Button, TextInput, StyleSheet } from "react-native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { RootStackParamList } from "../navigation/types";

type Props = NativeStackScreenProps<RootStackParamList, "Home">;

export default function HomeScreen({ navigation }: Props) {
  const [name, setName] = React.useState("Dmitriy");

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Home</Text>
      <Text style={styles.paragraph}>
        Multi-screen app using native-stack (bare RN).
      </Text>

      <TextInput
        value={name}
        onChangeText={setName}
        placeholder="Enter a name"
        style={styles.input}
      />

      <Button
        title="Go to Details"
        onPress={() => navigation.navigate("Details", { itemId: 42 })}
      />
      <View style={{ height: 12 }} />
      <Button
        title="Go to Profile (with param)"
        onPress={() => navigation.navigate("Profile", { name })}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, gap: 12, justifyContent: "center" },
  title: { fontSize: 28, fontWeight: "700" },
  paragraph: { fontSize: 16, lineHeight: 22, opacity: 0.8 },
  input: {
    borderWidth: 1,
    borderColor: "#ccc",
    padding: 10,
    borderRadius: 8,
  },
});

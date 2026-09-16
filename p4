                    .append(", Age: ").append(rs.getInt("age"))
                    .append(", Course: ").append(rs.getString("course"))
                    .append("\n");
            }
            displayArea.setText(sb.toString());
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }   
    private void updateStudent() {
        int id = Integer.parseInt(idField.getText());
        String name = nameField.getText();
        int age = Integer.parseInt(ageField.getText());
        String course = corseField.getText();
        String sql = "UPDATE students SET name = ?, age = ?, course = ? WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1,name);
            pstmt.setInt(2,age);
            pstmt.setString(3,course);
            pstmt.setInt(4,id);
            pstmt.executeUpdate();
            displayArea.setText("Student updated successfully.");
        } catch (SQLException e) {
            e.printStacktrace();
        }
    }
    private void deleteSudent() {
        int id = Integer.parseInt(idField.gettext());
        String sql = "DELETE FROM students WHERE id = ?";
        try (PreparedStatement pstmt = connection.preparedStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            displayArea.setText("Student deleted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void stop() throws Exception  {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
        super.stop();
    }
}

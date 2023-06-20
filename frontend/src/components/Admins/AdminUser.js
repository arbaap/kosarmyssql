import axios from "axios";
import React, { useEffect, useState } from "react";
import { Row, Col, Button, Table, Modal } from "react-bootstrap";
import { useRouteLoaderData } from "react-router-dom";
import Swal from "sweetalert2";

function AdminUser() {
  const [users, setUsers] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage] = useState(5);
  const [selectedUsers, setSelectedUsers] = useState(null);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const response = await axios.get("/user");
      setUsers(response.data.data);
    } catch (error) {
      console.log(error);
    }
  };

  const verifiedUser = (id, newStatus) => {
    axios
      .put(`/u/user?id=${id}`, { account_state: newStatus })
      .then((response) => {
        console.log(response.data);

        const updatedList = users.map((report) => {
          if (report.user_id === id) {
            return { ...report, account_state: newStatus };
          }
          return report;
        });
        Swal.fire("Okay", "User Verified", "success").then((updatedList) => {
          window.location.reload();
        });
        setUsers(updatedList);
      })
      .catch((error) => {
        console.error(error);
        Swal.fire("Oops", "Something Went Wrong", "error");
      });
  };

  const unverifiedUser = (id, newStatus) => {
    axios
      .put(`/u/user?id=${id}`, { account_state: newStatus })
      .then((response) => {
        console.log(response.data);

        const updatedList = users.map((report) => {
          if (report.user_id === id) {
            return { ...report, account_state: newStatus };
          }
          return report;
        });
        Swal.fire("Okay", "User Unverified", "success").then((updatedList) => {
          window.location.reload();
        });
        setUsers(updatedList);
      })
      .catch((error) => {
        console.error(error);
        Swal.fire("Oops", "Something Went Wrong", "error");
      });
  };

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const filteredUsers = users.filter(
    (user) => user.account_state === "Pending"
  );

  const indexOfLastItem = currentPage * itemsPerPage;
  const indexOfFirstItem = indexOfLastItem - itemsPerPage;
  const currentItems = filteredUsers.slice(indexOfFirstItem, indexOfLastItem);

  return (
    <Row>
      <Col>
        <h1>User List</h1>

        <Table bordered>
          <thead>
            <tr>
              <th>No</th>
              <th>Nik</th>
              <th>Name</th>
              <th>Email</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>

          <tbody>
            {currentItems.length > 0 ? (
              currentItems.map((user, index) => (
                <tr key={user.id}>
                  <td>{index + indexOfFirstItem + 1}</td>
                  <td>{user.nik}</td>
                  <td>{user.name}</td>
                  <td>{user.email}</td>
                  <td className="pending-status">{user.account_state}</td>

                  <td>
                    {user.account_state !== "pending" && (
                      <Button
                        className="btn_accepted"
                        onClick={() => verifiedUser(user.user_id, "Verified")}
                      >
                        Verified
                      </Button>
                    )}
                    {user.account_state !== "pending" && (
                      <Button
                        variant="danger"
                        className="btn_rejected"
                        onClick={() =>
                          unverifiedUser(user.user_id, "Unverified")
                        }
                      >
                        Unverified
                      </Button>
                    )}
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="5">No users available.</td>
              </tr>
            )}
          </tbody>
        </Table>

        <Pagination
          currentPage={currentPage}
          itemsPerPage={itemsPerPage}
          totalItems={users.length}
          onPageChange={handlePageChange}
        />
      </Col>
    </Row>
  );
}

function Pagination({ currentPage, itemsPerPage, totalItems, onPageChange }) {
  const pageNumbers = Math.ceil(totalItems / itemsPerPage);

  return (
    <nav>
      <ul className="pagination">
        {Array.from({ length: pageNumbers }, (_, i) => i + 1).map(
          (pageNumber) => (
            <li
              key={pageNumber}
              className={`page-item${
                currentPage === pageNumber ? " active" : ""
              }`}
            >
              <button
                className="page-link"
                onClick={() => onPageChange(pageNumber)}
              >
                {pageNumber}
              </button>
            </li>
          )
        )}
      </ul>
    </nav>
  );
}

export default AdminUser;

import React from "react";
import axios from "axios";
import "suneditor/dist/css/suneditor.min.css";
import CustomEditor from "../../components/CustomEditor";

const AddEducationPlace = () => {
  const [educationPlaceList, setEducationPlaceList] = React.useState([]);
  const [upazilaList, setUpazialList] = React.useState([]);
  const [upazilaId, setUpazilaId] = React.useState(-1);
  const [data, setData] = React.useState(null);
  const [action, setAction] = React.useState("create");
  const [blogLoading, setBlogLoading] = React.useState(false);
  const [isBlogAdded, setIsBlogAdded] = React.useState(false);
  const [isBlogPublished, setIsBlogPublished] = React.useState(false);
  const [editorContent, setEditorContent] = React.useState("");

  React.useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/education-place`)
      .then((res) => {
        setEducationPlaceList(res.data);
      });
  }, []);

  React.useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/upazila`)
      .then((res) => {
        console.log(res.data);
        setUpazialList(res.data);
      });
  }, []);

  const handleIsBlogAdded = () => {
    setIsBlogAdded(!isBlogAdded);
  };

  const handleIsBlogPublished = () => {
    setIsBlogPublished(!isBlogPublished);
  };

  const blogHandler = (target, method, _id) => {
    setBlogLoading(true);
    const payload = {
      name: target["name"].value,
      address: target["address"].value,
      contact: target["contact"].value,
      upazilaId: parseInt(target["upazilaId"].value),
    };
    const formData = new FormData();
    formData.append("payload", JSON.stringify(payload));
    if (isBlogAdded) {
      formData.append(
        "post",
        JSON.stringify({
          bannerImg: data?.description?.bannerImg || "",
          postTitle: target["postTitle"].value,
          content: target["content"].value,
          isVisible: isBlogPublished,
          id: data?.postId || null,
        })
      );
      formData.append("image", target["bannerImg"].files[0]);
    }
    try {
      axios[method](
        `${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/education-place${_id ? `/${_id}` : ""}`,
        formData,
        {
          withCredentials: true,
          headers: {
            "Content-Type": "multipart/form-data",
          },
        }
      )
        .then((res) => {
          if (res.status === 201) {
            if (_id) {
              setEducationPlaceList((pre) => {
                const newEducationPlaceList = [...pre];
                newEducationPlaceList[
                  educationPlaceList.indexOf((info) => info.id === _id)
                ] = res?.data;
                return newEducationPlaceList;
              });
              alert("ব্যাংক তথ্য আপডেট হয়েছে");
            } else {
              setEducationPlaceList([...educationPlaceList, res.data]);
              alert("ব্যাংক তথ্য যুক্ত হয়েছে");
            }
          } else {
            console.log(res.data);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    } catch (error) {
      console.log(error.message);
    } finally {
      setBlogLoading(false);
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (action === "create") {
      blogHandler(e.target, "post");
    } else if (action === "update") {
      blogHandler(e.target, "put", data?.id);
    }
    e.target.reset();
  };

  const handleDelete = async (id) => {
    try {
      axios
        .delete(
          `${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/education-place/${id}`,
          {
            withCredentials: true,
          }
        )
        .then((res) => {
          if (res.status === 204) {
            const newEducationPlaceList = educationPlaceList.filter(
              (info) => info.id !== id
            );
            setEducationPlaceList(newEducationPlaceList);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    } catch (error) {
      console.log(error.message);
    }
  };

  const handleEnableEditing = async (blog) => {
    setData(blog);
    setUpazilaId(blog?.upazilaId);
    setEditorContent(blog?.description?.content);
    setIsBlogAdded(!!blog?.postId);
    setIsBlogPublished(!!blog?.description?.isVisible);
  };

  return (
    <>
      <h2 className="mb-6 text-center text-3xl font-bold text-gray-900">
        শিক্ষা প্রতিষ্ঠান তথ্য
      </h2>
      {educationPlaceList.length > 0 ? (
        <table className="border-separate w-full border-spacing-y-2 text-sm">
          <thead className="text-left">
            <tr>
              <th className="ps-4">ID</th>
              <th className="ps-4">Title</th>
              <th className="ps-4">Available blog ID</th>
              <th className="ps-4">Actions</th>
            </tr>
          </thead>
          <tbody>
            {educationPlaceList.map((upazila) => (
              <tr key={upazila.id}>
                <td className="td-class">{upazila.id}</td>
                <td className="td-class">{upazila.name}</td>
                <td className="td-class">{upazila.postId}</td>
                <td className="td-class flex space-x-3">
                  <button onClick={() => handleEnableEditing(upazila)}>
                    <svg
                      clipRule="evenodd"
                      fillRule="evenodd"
                      strokeLinejoin="round"
                      strokeMiterlimit="2"
                      viewBox="0 0 24 24"
                      width="24"
                      height="24"
                      fill="currentColor"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="m11.25 6c.398 0 .75.352.75.75 0 .414-.336.75-.75.75-1.505 0-7.75 0-7.75 0v12h17v-8.75c0-.414.336-.75.75-.75s.75.336.75.75v9.25c0 .621-.522 1-1 1h-18c-.48 0-1-.379-1-1v-13c0-.481.38-1 1-1zm-2.011 6.526c-1.045 3.003-1.238 3.45-1.238 3.84 0 .441.385.626.627.626.272 0 1.108-.301 3.829-1.249zm.888-.889 3.22 3.22 8.408-8.4c.163-.163.245-.377.245-.592 0-.213-.082-.427-.245-.591-.58-.578-1.458-1.457-2.039-2.036-.163-.163-.377-.245-.591-.245-.213 0-.428.082-.592.245z"
                        fillRule="nonzero"
                      />
                    </svg>
                  </button>
                  <button onClick={() => handleDelete(upazila.id)}>
                    <svg
                      clipRule="evenodd"
                      fillRule="evenodd"
                      strokeLinejoin="round"
                      strokeMiterlimit="2"
                      viewBox="0 0 24 24"
                      width="24"
                      height="24"
                      fill="currentColor"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="m4.015 5.494h-.253c-.413 0-.747-.335-.747-.747s.334-.747.747-.747h5.253v-1c0-.535.474-1 1-1h4c.526 0 1 .465 1 1v1h5.254c.412 0 .746.335.746.747s-.334.747-.746.747h-.254v15.435c0 .591-.448 1.071-1 1.071-2.873 0-11.127 0-14 0-.552 0-1-.48-1-1.071zm14.5 0h-13v15.006h13zm-4.25 2.506c-.414 0-.75.336-.75.75v8.5c0 .414.336.75.75.75s.75-.336.75-.75v-8.5c0-.414-.336-.75-.75-.75zm-4.5 0c-.414 0-.75.336-.75.75v8.5c0 .414.336.75.75.75s.75-.336.75-.75v-8.5c0-.414-.336-.75-.75-.75zm3.75-4v-.5h-3v.5z"
                        fillRule="nonzero"
                      />
                    </svg>
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      ) : (
        <p className="bg-gray-100 ps-2 rounded-md">কোন তথ্য পাওয়া যায়নি</p>
      )}

      <h6 className="mb-4 mt-10 font-bold text-gray-900">
        নতুন শিক্ষা প্রতিষ্ঠান যুক্ত করুন
      </h6>
      <form
        onSubmit={handleSubmit}
        className="border border-gray-300 rounded-md overflow-hidden"
      >
        <input
          required
          name="name"
          type="text"
          defaultValue={data?.name}
          className="appearance-none relative block w-full px-3 py-2 border-b  border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
          placeholder="শিক্ষা প্রতিষ্ঠানের নাম"
        />
        <input
          required
          name="address"
          type="text"
          defaultValue={data?.name}
          className="appearance-none relative block w-full px-3 py-2 border-b  border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
          placeholder="ঠিকানা"
        />
        <input
          required
          name="contact"
          type="text"
          defaultValue={data?.name}
          className="appearance-none relative block w-full px-3 py-2 border-b  border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
          placeholder="যোগাযোগ"
        />
        <select
          id="upazilaId"
          name="upazilaId"
          value={upazilaId}
          onChange={(e) => setUpazilaId(e.target.value)}
          className="w-full appearance-none relative block px-3 py-2 border-b border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
        >
          <option value={-1}>উপজেলা নির্বাচন করুন</option>
          {upazilaList.map((upzila) => (
            <option key={upzila.id} value={upzila.id}>
              {upzila.name}
            </option>
          ))}
        </select>
        <div className="px-3 py-2 flex flex-col space-y-2">
          <label className="inline-flex items-center cursor-pointer">
            <span className="me-3 text-sm text-gray-900">
              ব্লগ যুক্ত করতে চান?
            </span>
            <input
              type="checkbox"
              value={isBlogAdded}
              checked={isBlogAdded}
              onChange={handleIsBlogAdded}
              className="sr-only peer"
            />
            <div className="relative w-11 h-6 bg-zinc-400 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-gray-200 after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-green-500"></div>
          </label>
          {isBlogAdded && (
            <label className="inline-flex items-center cursor-pointer">
              <span className="me-3 text-sm text-gray-900">
                ব্লগ প্রকাশ করতে চান?
              </span>
              <input
                type="checkbox"
                value={isBlogPublished}
                checked={isBlogPublished}
                onChange={handleIsBlogPublished}
                className="sr-only peer"
              />
              <div className="relative w-11 h-6 bg-zinc-400 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-gray-200 after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-green-500"></div>
            </label>
          )}
        </div>
        <CustomEditor
          oldData={data?.description}
          isPostAdded={isBlogAdded}
          editorContent={editorContent}
          setEditorContent={setEditorContent}
        />
        <button
          type="submit"
          onClick={() => setAction("create")}
          className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          {blogLoading ? (
            <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white"></div>
          ) : (
            "Create new"
          )}
        </button>
        {data && (
          <button
            type="submit"
            onClick={() => setAction("update")}
            className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-b-md text-white bg-sky-500 hover:bg-sky-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-sky-400"
          >
            {blogLoading ? (
              <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white"></div>
            ) : (
              "Update existing"
            )}
          </button>
        )}
      </form>
    </>
  );
};

export default AddEducationPlace;

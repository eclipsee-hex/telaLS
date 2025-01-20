defmodule Tela.WebTest do
  use Tela.DataCase

  alias Tela.Web

  describe "pages" do
    alias Tela.Web.Page

    import Tela.WebFixtures

    @invalid_attrs %{"index.html": nil}

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Web.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Web.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      valid_attrs = %{"index.html": "some index.html"}

      assert {:ok, %Page{} = page} = Web.create_page(valid_attrs)
      assert page.index.html == "some index.html"
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Web.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      update_attrs = %{"index.html": "some updated index.html"}

      assert {:ok, %Page{} = page} = Web.update_page(page, update_attrs)
      assert page.index.html == "some updated index.html"
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = Web.update_page(page, @invalid_attrs)
      assert page == Web.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = Web.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> Web.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Web.change_page(page)
    end
  end
end

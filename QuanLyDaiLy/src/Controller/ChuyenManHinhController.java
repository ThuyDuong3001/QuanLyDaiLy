package Controller;

import Bean.DanhMucBean;
import View.CongNoJPanel;
import View.DoanhSoJPanel;
import View.HoSoJPanel;
import View.PhieuNhapJPanel;
import View.PhieuThuJPanel;
import View.PhieuXuatJPanel;
import View.TaiKhoanJPanel;
import View.TrangChuJPanel;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.List;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class ChuyenManHinhController {

    private JPanel root;
    private String kindSelected = "";

    private List<DanhMucBean> ListItem = null;

    public ChuyenManHinhController(JPanel jpnRoot) {
        this.root = jpnRoot;
    }

    public void setView(JPanel jpnItem, JLabel jlbItem) {
        kindSelected = "TrangChu";

        jpnItem.setBackground(new Color(96, 100, 191));
        jlbItem.setBackground(new Color(96, 100, 191));

        root.removeAll();
        root.setLayout(new BorderLayout());
        root.add(new TrangChuJPanel());
        root.validate();
        root.repaint();
    }

    public void setEvent(List<DanhMucBean> ListItem) {
        this.ListItem = ListItem;

        for (DanhMucBean item : ListItem) {
            item.getJlb().addMouseListener(new LabelEvent(item.getKind(), item.getJpn(), item.getJlb()));
        }
    }

    class LabelEvent implements MouseListener {

        private JPanel node;
        private String kind;

        private JPanel jpnItem;
        private JLabel jlbItem;

        public LabelEvent(String kind, JPanel jpnItem, JLabel jlbItem) {
            this.kind = kind;
            this.jpnItem = jpnItem;
            this.jlbItem = jlbItem;
        }

        @Override
        public void mouseClicked(MouseEvent e) {
            switch (kind) {
                case "TrangChu":
                    node = new TrangChuJPanel();
                    break;

                case "HoSo":
                    node = new HoSoJPanel();
                    break;
                case "TaiKhoan":
                    node = new TaiKhoanJPanel();
                    break;
                case "PhieuNhap":
                    node = new PhieuNhapJPanel();
                    break;
                case "PhieuXuat":
                    node = new PhieuXuatJPanel();
                    break;
                case "PhieuThu":
                    node = new PhieuThuJPanel();
                    break;
                case "CongNo":
                    node = new CongNoJPanel();
                    break;
                case "DoanhSo":
                    node = new DoanhSoJPanel();
                    break;

                default:
                    break;
            }
            root.removeAll();
            root.setLayout(new BorderLayout());
            node.setSize(root.getWidth(), root.getHeight());
            root.add(node);

            root.validate();
            root.repaint();
            setChangeBackgroud(kind);

        }

        @Override
        public void mousePressed(MouseEvent e) {
            kindSelected = kind;
            jpnItem.setBackground(new Color(0, 134, 179));
            jlbItem.setBackground(new Color(0, 134, 179));
        }

        @Override
        public void mouseReleased(MouseEvent e) {

        }

        @Override
        public void mouseEntered(MouseEvent e) {
            jpnItem.setBackground(new Color(0, 134, 179));
            jlbItem.setBackground(new Color(0, 134, 179));
        }

        @Override
        public void mouseExited(MouseEvent e) {
            if (!kindSelected.equalsIgnoreCase(kind)) {
                jpnItem.setBackground(new Color(0, 180, 153));
                jlbItem.setBackground(new Color(0, 180, 153));
            }
        }

    }

    private void setChangeBackgroud(String kind) {
        for (DanhMucBean item : ListItem) {
            if (item.getKind().equalsIgnoreCase(kind)) {
                item.getJlb().setBackground(new Color(0, 134, 179));
                item.getJpn().setBackground(new Color(0, 134, 179));

            } else {
                item.getJlb().setBackground(new Color(0, 180, 153));
                item.getJpn().setBackground(new Color(0, 180, 153));
            }
        }
    }
}
